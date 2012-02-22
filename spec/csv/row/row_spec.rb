require 'smart_csv'

describe "Check class CSV::Row" do

  before(:each) do
    data = "id,firstname,lastname\n1,One,One\n2,Two,Two\n4,Four,Four\n5,Five,Five\n6,One,One"
    @data = CSV.parse(data, {:col_sep => ',', :headers => true})
  end

  it "should correct updete record" do
    @data[2].update("lastname" => "Seven", "id" => "2012")
    @data.where("id" => "2012").size.should eql(1)
  end

end
