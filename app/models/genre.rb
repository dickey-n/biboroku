class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '絵画' },
    { id: 3, name: '現代アート' },
    { id: 4, name: '版画' },
    { id: 5, name: '立体' },
    { id: 6, name: '彫刻' },
    { id: 7, name: '写真' },
    { id: 8, name: '映像' },
    { id: 9, name: 'インスタレーション' },
    { id: 10, name: '漫画' },
    { id: 11, name: 'ファッション' },
    { id: 12, name: 'その他' }
  ]
end
