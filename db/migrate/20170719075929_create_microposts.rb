class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :user, foreign_key: true
      #user_idカラムとして存在する。Micropostを発言したユーザーを特定するために用いる

      t.timestamps
    end
  end
end
