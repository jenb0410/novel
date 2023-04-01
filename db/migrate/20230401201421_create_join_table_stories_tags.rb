class CreateJoinTableStoriesTags < ActiveRecord::Migration[7.0]
  def change
    create_join_table :stories, :tags do |t|
      # t.index [:story_id, :tag_id]
      # t.index [:tag_id, :story_id]
    end
  end
end
