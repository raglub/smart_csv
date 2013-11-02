# SmartCSV

[![Gem Version](https://badge.fury.io/rb/smart_csv.png)](http://badge.fury.io/rb/smart_csv)
[![Build Status](https://travis-ci.org/raglub/smart_csv.png)](https://travis-ci.org/raglub/smart_csv)
[![Code Climate](https://codeclimate.com/github/raglub/smart_csv.png)](https://codeclimate.com/github/raglub/smart_csv)
[![Dependency Status](https://gemnasium.com/raglub/smart_csv.png)](https://gemnasium.com/raglub/smart_csv)
[![Coverage Status](https://coveralls.io/repos/raglub/smart_csv/badge.png)](https://coveralls.io/r/raglub/smart_csv)

Extend CSV class. CSV can delete or select some records.

Compatible with:
Ruby 1.9.2, 1.9.3, and 2.0.0

# Getting started

For Example we can use following data

```ruby
data = "id,firstname,lastname\n1,One,One\n2,Two,Two\n4,One,Four\n5,One,Five"
csv = CSV.parse(data, {:col_sep => ',', :headers => true}
```

And now we can:

* create a new record

```ruby
csv.create("id"=> '13', "lastname" => '1992')
```

* select records

```ruby
csv.where('firstname' => 'One').where_not('id' => '4')
```
* select opposite records

```ruby
csv.not{where('firstname' => 'One')}
```

* select records which satisfy two conditions

```ruby
csv.where('firstname' => 'One').and{lt('id', 4)}
```

* select records which satisfy one of two conditions

```ruby
csv.where('firstname' => 'One').or{where('firstname' => 'Two')}
```

* update record

```ruby
csv.where('firstname' => 'One').first.update({"lastname" => "Seven", "wartosc" => 2012}) }
```

* delete all records

```ruby
csv.delete_all
```

* delete all records from scope of condition

```ruby
csv.where('firstname' => 'One').delete_all
```

* select all records which have 'id' attribute greater than 2

```ruby
csv.gt('id', '2')
```

* select all records which have 'id' attribute greater or equal 2

```ruby
csv.ge('id', '2')
```

* select all records which have 'id' attribute less than 2

```ruby
csv.lt('id', '2')
```

* select all records which have 'id' attribute less or equal 2

```ruby
csv.le('id', '2')
```

* select all records which have 'firstname' attribute equal 'Tom'

```ruby
csv.eq('firstname', 'Tom')
```

* select all records which have 'firstname' attribute not equal 'Tom'

```ruby
csv.ne('firstname', 'Tom')
```

# License

SmartCSV uses the MIT license. Please check the [LICENSE][] file for more details.

[license]: https://github.com/raglub/smart_csv/blob/master/LICENSE
