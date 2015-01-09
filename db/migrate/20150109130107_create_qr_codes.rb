class CreateQrCodes < ActiveRecord::Migration
  def change
    create_table :qr_codes do |t|
      t.string :qrcode
      t.string :qrlink
      t.string :url
      t.string :src
      t.string :medium
      t.string :campaign
      t.string :content
      t.string :term

      t.timestamps
    end
  end
end
