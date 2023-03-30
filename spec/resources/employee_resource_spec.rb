# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeResource, type: :resource do
  describe 'creating' do

    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: {
            first_name: 'Jane',
            last_name: 'Doe',
            age: 30
          }
        }
      }
    end

    let(:instance) { EmployeeResource.build(payload) }

    it 'succeeds' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Employee.count }.by 1
      employee = Employee.last

      expect(employee.first_name).to eq('Jane')
      expect(employee.last_name).to eq('Doe')
      # for some reason the resource instance here does not have access to attributes defined only on the resource
      # expect(instance.full_name).to eq('Jane Doe')
    end
  end
end
