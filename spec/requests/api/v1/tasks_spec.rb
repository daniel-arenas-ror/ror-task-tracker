require 'rails_helper'

RSpec.describe "Api::V1::Tasks", type: :request do
  describe "GET /api/v1/tasks" do
    it "returns a list of tasks" do
      create_list(:task, 3)

      get api_v1_tasks_path

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(3)
    end

  end

  describe "POST /api/v1/tasks" do
    context "with valid parameters" do
      let(:valid_attributes) { { task: attributes_for(:task, description: Faker::Lorem.sentence) } }

      it "creates a new Task" do
        expect {
          post api_v1_tasks_path, params: valid_attributes
        }.to change(Task, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters (missing title)" do
      let(:valid_attributes) { { task: attributes_for(:task, description: nil) } }

      it "creates a new Task" do
        expect {
          post api_v1_tasks_path, params: valid_attributes
        }.to change(Task, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
