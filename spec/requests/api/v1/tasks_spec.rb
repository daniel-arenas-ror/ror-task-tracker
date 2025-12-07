require 'rails_helper'

RSpec.describe "Api::V1::Tasks", type: :request do
  describe "POST /api/v1/tasks" do
    context "with valid parameters" do
      let(:valid_attributes) { { task: attributes_for(:task, description: "Factory Generated Task") } }

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
