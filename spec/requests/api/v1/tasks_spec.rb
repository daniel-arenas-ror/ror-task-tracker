require 'rails_helper'

RSpec.describe "Api::V1::Tasks", type: :request do
  describe "GET /api/v1/tasks" do
    let!(:task_1_older) { create(:task, created_at: 2.days.ago) }
    let!(:task_2_middle) { create(:task, created_at: 1.days.ago) }
    let!(:task_3_new) { create(:task) }

    it "returns the correct number of tasks" do
      get api_v1_tasks_path

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(3)
    end


    it "returns tasks sorted by created_at descending (newest first)" do
      get api_v1_tasks_path

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)

      expected_ids_in_order = [task_3_new.id, task_2_middle.id, task_1_older.id]
      actual_ids_in_order = json_response.map { |task| task['id'] }

      expect(actual_ids_in_order).to eq(expected_ids_in_order)
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
