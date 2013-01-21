class AddClipAttachmentToOrders < ActiveRecord::Migration
  def change
    add_attachment :orders, :clip
  end
end
