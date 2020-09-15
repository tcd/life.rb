# I was very surprised that this worked.
# See https://stackoverflow.com/questions/44090712/how-to-use-tsvector-update-trigger-with-array-types-in-postgresql
class AddTsvectorIndexBookmarks < ActiveRecord::Migration[6.0]

  def change()
    add_column(:bookmarks, :tsv, :tsvector)
    add_index(:bookmarks, :tsv, using: 'gin')

    reversible do |dir|

      dir.up do
        execute <<-SQL
          CREATE FUNCTION update_tsv() RETURNS trigger AS $$
          BEGIN
            new.tsv :=
              to_tsvector('pg_catalog.simple', coalesce(new.url,'')) ||
              to_tsvector('pg_catalog.simple', coalesce(new.title,'')) ||
              to_tsvector('pg_catalog.simple', coalesce(new.description,'')) ||
              to_tsvector('pg_catalog.simple', coalesce(array_to_string(new.tags, ' '),'')) ||
              to_tsvector('pg_catalog.simple', coalesce(array_to_string(new.folders, ' '),''));
            return new;
          END
          $$ LANGUAGE plpgsql;

          CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
          ON bookmarks FOR EACH ROW EXECUTE PROCEDURE update_tsv();
        SQL

        # Trigger re-index on existing rows
        execute("UPDATE bookmarks SET id = id")
      end

      dir.down do
        execute <<-SQL
          DROP TRIGGER tsvectorupdate
          ON bookmarks;
          DROP FUNCTION update_tsv();
        SQL
      end

    end
  end

end
