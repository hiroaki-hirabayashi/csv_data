class ImportCsv < ApplicationRecord
 path = File.join Rails.root, "db/csv/csv_data.csv"
  def self.import(path)
    list = []
     CSV.foreach(path, headers: true) do |row|
       list << {
         name: row["name"],
         age: row["age"],
         address: row["address"]
       }
     end
     User.create(list)
     puts "インポート処理を開始します!"
     begin
       User.create!(list)
       puts "インポート完了!!!"
     rescue ActiveModel::UnknownAttributeError => invalid
       puts "インポートに失敗。。。：UnknownAttributeError"
     end
   end
 end


 # class ImportCsv < ApplicationRecord
 #   # CSVデータのパスを引数として受け取り、インポート処理を実行
 #   def self.import(path)
 #      CSV.foreach(path, headers: true) do |row|
 #        User.create(
 #          name: row["name"],
 #          age: row["age"],
 #          address: row["address"]
 #        )
 #      end
 #   end
 # end
