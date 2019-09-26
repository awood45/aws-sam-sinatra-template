require 'aws-record'

class AppTable
  include Aws::Record
  set_table_name(ENV["TABLE_NAME"])

  string_attr :hk, hash_key: true
end
