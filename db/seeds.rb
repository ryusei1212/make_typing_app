User.create!(name: 'foo',
            email: 'foo@example.com',
            password: 'foobar',
            password_confirmation: 'foobar',
            activated: true
          )

User.create!(name: 'bar',
            email: 'bar@example.com',
            password: 'barbar',
            password_confirmation: 'barbar',
            activated: true
)

users = User.first
users.titles.create!(
  title: 'ホームポジション(左手)',
  texts_attributes: [
    {
      sentence: 'qwerttrewq'
    },
    {
      sentence: 'asdfggfdsa'
    },
    {
      sentence: 'zxcvvcxz'
    }
  ]
)

users.titles.create!(
  title: 'ホームポジション(右手)',
  texts_attributes: [
    {
      sentence: 'poiuyyuiop'
    },
    {
      sentence: 'hjkl;;lkjh'
    },
    {
      sentence: '/.,mnbn,./'
    }
  ]
)

users.titles.create!(
  title: 'ホームポジション(左手ランダム)',
  texts_attributes: [
    {
      sentence: 'trdasdgcv'
    },
    {
      sentence: 'atrzcrgwx'
    },
    {
      sentence: 'dterzaaqt'
    }
  ]
)

users.titles.create!(
  title: 'ホームポジション(右手ランダム)',
  texts_attributes: [
    {
      sentence: 'jkyunmiop'
    },
    {
      sentence: 'ljkl,pyuk'
    },
    {
      sentence: 'py.hiounl'
    }
  ]
)

users.titles.create!(
  title: 'アルファベット',
  texts_attributes: [
    {
      sentence: 'abcdefgh'
    },
    {
      sentence: 'ijklmnop'
    },
    {
      sentence: 'qrstuvwxyg'
    }
  ]
)

users.titles.create!(
  title: '五十音',
  texts_attributes: [
    {
      sentence: 'aiueo kakikukeko'
    },
    {
      sentence: 'sasisuseso tatituteto'
    },
    {
      sentence: 'naninuneno hahihuheho'
    },
    {
      sentence: 'mamimumemo yayuyo'
    },
    {
      sentence: 'rarirurero waon'
    }
  ]
)
