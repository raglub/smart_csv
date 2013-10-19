# SmartCSV

[![Gem Version](https://badge.fury.io/rb/smart_csv.png)](http://badge.fury.io/rb/smart_csv)

Extend CSV class. CSV can delete or select some records.

Compatible with:
Ruby 1.9.2, 1.9.3, and 2.0.0

## FOR EXAMPLE

```ruby
data = "id,firstname,lastname\n1,One,One\n2,Two,Two\n4,One,Four\n5,One,Five"
@data = CSV.parse(data, {:col_sep => ',', :headers => true}
```
## METHODS

* Create a new record

```ruby
@data.create("id"=> '13', "lastname" => '1992')
```

* Select records

```ruby
@data.where('firstname' => 'One').where_not('id' => '4')
```

* Update record

```ruby
@data.where('firstname' => 'One').first.update({"lastname" => "Seven", "wartosc" => 2012}) }
```

* Delete all records

```ruby
@data.delete_all
```

* Delete all records from scope of condition

```ruby
@data.where('firstname' => 'One').delete_all
```

* Select all records which have 'id' attribute greater than 2

```ruby
@data.gt('id', '2')
```

* Select all records which have 'id' attribute greater or equal 2

```ruby
@data.ge('id', '2')
```

* Select all records which have 'id' attribute less than 2

```ruby
@data.lt('id', '2')
```

* Select all records which have 'id' attribute less or equal 2

```ruby
@data.le('id', '2')
```

* Select all records which have 'firstname' attribute equal 'Tom'

```ruby
@data.eq('firstname', 'Tom')
```

* Select all records which have 'firstname' attribute not equal 'Tom'

```ruby
@data.ne('firstname', 'Tom')
```
