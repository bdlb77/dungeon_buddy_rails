class RenameCharacterClassColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :campaign_characters, :class, :character_class
  end
end
