require 'spec_helper'

describe CSV::Table do

  let(:csv_data) {"id,firstname,lastname
1,One,One
2,Two,Two
4,Four,Four
5,Five,Five
6,One,One"}

  let(:csv) { CSV.parse(csv_data, {:col_sep => ',', :headers => true}) }

  it "should correct create one record" do
    csv.size.should eq(5)
    csv.create("id"=> '13', "lastname" => '1992')
    csv.size.should eq(6)
    csv[-1]["id"].should eql('13')
  end

  it "should correct select records" do
    csv.where('firstname' => 'One').size.should eql(2)
    csv.where('firstname' => 'One').where_not('id' => '6').size.should eql(1)
  end

  it "#not" do
    csv.not{where('firstname' => "One")}.size.should eql(3)
  end

  it "should select records with id greater than 2" do
    csv.gt('id', 2).size.should eq(3)
  end

  it "should select records with id greater than or equal to 2" do
    csv.ge('id', 2).size.should eq(4)
  end

  it "should select records with id less than 2" do
    csv.lt('id', 2).size.should eq(1)
  end

  it "should select records with id less than or equal to 2" do
    csv.le('id', 2).size.should eq(2)
  end

  it "should select records with firstname equal to 'Four'" do
    csv.eq('firstname', 'Four').size.should eq(1)
  end

  it "should select records with firstname not equal to 'Four'" do
    csv.ne('firstname', 'Four').size.should eq(4)
  end

  it "should correct delete records" do
    csv.size.should eql(5)
    csv.delete_all
    csv.size.should eql(0)
  end

  it "should correct delete records with selected group" do
    csv.size.should eql(5)
    csv.where('firstname' => 'One').delete_all
    csv.size.should eql(3)
  end

end
