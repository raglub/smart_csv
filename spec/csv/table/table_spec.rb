require 'smart_csv'

describe CSV::Table do

  let(:csv_data) {"id,firstname,lastname\n1,One,One\n2,Two,Two\n4,Four,Four\n5,Five,Five\n6,One,One"}

  let(:parse_data) { CSV.parse(csv_data, {:col_sep => ',', :headers => true}) }

  it "should correct create one record" do
    parse_data.size.should eq(5)
    parse_data.create("id"=> '13', "lastname" => '1992')
    parse_data.size.should eq(6)
    parse_data[-1]["id"].should eql('13')
  end

  it "should correct select records" do
    parse_data.where('firstname' => 'One').size.should eql(2)
    parse_data.where('firstname' => 'One').where_not('id' => '6').size.should eql(1)
  end

  it "should select records with id greater than 2" do
    parse_data.gt('id', 2).size.should eq(3)
  end

  it "should select records with id greater than or equal to 2" do
    parse_data.ge('id', 2).size.should eq(4)
  end

  it "should select records with id less than 2" do
    parse_data.lt('id', 2).size.should eq(1)
  end

  it "should select records with id less than or equal to 2" do
    parse_data.le('id', 2).size.should eq(2)
  end

  it "should select records with firstname equal to 'Four'" do
    parse_data.eq('firstname', 'Four').size.should eq(1)
  end

  it "should select records with firstname not equal to 'Four'" do
    parse_data.ne('firstname', 'Four').size.should eq(4)
  end

  it "should correct delete records" do
    parse_data.size.should eql(5)
    parse_data.delete_all
    parse_data.size.should eql(0)
  end

  it "should correct delete records with selected group" do
    parse_data.size.should eql(5)
    parse_data.where('firstname' => 'One').delete_all
    parse_data.size.should eql(3)
  end

end
