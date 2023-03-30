class EmployeeResource < ApplicationResource
  attribute :first_name, :string do
    @object.first_name.upcase
  end
  attribute :full_name, :string do
    "#{@object.first_name} #{@object.last_name}"
  end
  attribute :employment_type, :string do
    "full time"
  end
  attribute :last_name, :string
  attribute :age, :integer
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
end
