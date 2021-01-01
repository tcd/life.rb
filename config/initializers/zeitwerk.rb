TO_COLLAPSE = [
  # "app/admin",
  "app/admin/financial",
  "app/models/financial",
].freeze()

loader = Rails.autoloaders.main
# loader.logger = Rails.logger
TO_COLLAPSE.each do |path|
  loader.collapse(path)
end
