require 'smart_csv'

describe "Check class CSV::Table" do
  before(:each) do
    data = "id,firstname,lastname\n1,One,One\n2,Two,Two\n4,Four,Four\n5,Five,Five\n6,One,One"
    @data = CSV.parse(data, {:col_sep => ',', :headers => true})
  end

  it "should correct create one record" do
    @data.size.should eql(5)
    @data.create("id"=> '13', "lastname" => '1992')
    @data.size.should eql(6)
    @data[-1]["id"].should eql('13')
  end

  it "should correct select records" do
    @data.where('firstname' => 'One').size.should eql(2)
    @data.where('firstname' => 'One').where_not('id' => '6').size.should eql(1)
  end

  it "should correct delete records" do
    @data.size.should eql(5)
    @data.delete_all
    @data.size.should eql(0)
  end
end
