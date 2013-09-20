== SmartCSV

Extend CSV class.
This gem need header.

== FOR EXAMPLE

  data = "id,firstname,lastname\n1,One,One\n2,Two,Two\n4,One,Four\n5,One,Five"
  @data = CSV.parse(data, {:col_sep => ',', :headers => true}

== METHODS

* Create a new record
   @data.create("id"=> '13', "lastname" => '1992')

* Select records
   @data.where('firstname' => 'One').where_not('id' => '4')

* Update record
   @data.where('firstname' => 'One').first.update({"lastname" => "Seven", "wartosc" => 2012}) }

* Delete all records
   @data.delete_all

* Delete all records from scope of condition
   @data.where({'firstname' => 'One'}).delete_all

