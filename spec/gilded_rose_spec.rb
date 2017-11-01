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

   it "quality cannot be negative" do
     items = [Item.new("foo", 10, 0)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq(0)
   end

   it "cannot exceed 50" do
     items = [Item.new("Aged Brie", 10, 50)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq(50)
   end

   it "does not decrease sell_in for Sulfuras" do
     items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].sell_in).to eq(10)
   end

   it "does not decrease quality for Sulfuras" do
     items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq(10)
   end

   it "backstage passes increase in quality by 2 as sell_in is 10 or less" do
     items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].sell_in).to eq(9)
     expect(items[0].quality).to eq(12)
   end

   it "backstage passes increase in quality by 3 as sell_in is 5 or less" do
     items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].sell_in).to eq(4)
     expect(items[0].quality).to eq(13)
   end

   it "backstage passes quality drops to 0 after the concert" do
     items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].sell_in).to eq(-1)
     expect(items[0].quality).to eq(0)
   end

   it "aged brie increases in quality the older it gets" do
     items = [Item.new("Aged Brie", 10, 10)]
     GildedRose.new(items).update_quality()
     expect(items[0].sell_in).to eq(9)
     expect(items[0].quality).to eq(11)
   end


 end



end
