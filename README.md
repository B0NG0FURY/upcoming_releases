# UpcomingReleases

See all the upcoming indie album releases in one list.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'upcoming_releases'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install upcoming_releases

## Usage

bin/upcoming-releases
'list artist' for list ordered alphabetically by artist
'list label' for list ordered alphabetically by record label

75. Artist: Sonic’s Rendezvous Band   Album: No Sleep Till Ypsilanti   Label: Bang
76. Artist: Spectral Voice   Album: Necrotic Demos   Label: Dark Descent
77. Artist: Spits   Album: Vi   Label: Thriftstore Records

Enter number of album for more information

entering 77 will return:
--------------------
Spits - Vi
                    
LP: $19.75, 11/06/2020
 
Ripping through a portal from the basements of Kalamazoo, Michigan, the release of The Spits VI has arrived. This full length, self recorded album from Thriftstore Records ranges from the weird to the wild. Buzz saw guitars and catchy hooks are mixed with low budget horror effects to create a unique view of a dystopian world. With songs of terror, despair, hope and heartbreak, this one has something for the whole nuclear family!
--------------------

'back' will prompt user how they want list ordered again
'exit' will exit program


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/upcoming_releases. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/upcoming_releases/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UpcomingReleases project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/upcoming_releases/blob/master/CODE_OF_CONDUCT.md).
