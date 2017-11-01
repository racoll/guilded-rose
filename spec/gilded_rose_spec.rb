require "gilded_rose"

RSpec.describe GildedRose do

  describe "#update_quality" do
   it "does not change the name" do
     items = [Item.new("foo", 0, 0)] # 0 date and 0 quality, named foo
     GildedRose.new(items).update_quality()
     expect(items[0].name).to eq "foo"
   end

   it "decreases sell_in by 1" do
     items = [Item.new("foo", 10, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].sell_in).to eq(9)
   end

   it "decreases quality by 1" do
     items = [Item.new("foo", 10, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq(9)
   end

   it "cannot exceed 50" do
     items = [Item.new("Aged Brie", 10, 50)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq(50)
   end
 end


end
