class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: 'レディース' },
      { id: 3, name: 'メンズ' },
      { id: 4, name: 'ベビー・キッズ' },
      { id: 5, name: 'インテリア・住まい・小物' },
      { id: 6, name: '本・音楽・ゲーム' },
      { id: 7, name: 'おもちゃ・ホビー・グッズ' },
      { id: 8, name: '家電・スマホ・カメラ' },
      { id: 9, name: 'スポーツ・レジャー' },
      { id: 10, name: 'ハンドメイド'},
      { id: 11, name: 'その他' }
    ]
   
     include ActiveHash::Associations
     has_many :products

     def State 
      @states = Post.all
      self.data = [
        { id: 1, name: '--' },
        { id: 2, name: '新品・未使用' },
        { id: 3, name: '未使用に近い' },
        { id: 4, name: '目立った傷や汚れなし' },
        { id: 5, name: 'やや傷や汚れあり' },
        { id: 6, name: '傷や汚れあり' },
        { id: 7, name: '全体的に状態が悪い' }
      ]
     
       include ActiveHash::Associations
       has_many :products
     
      end
    end

    