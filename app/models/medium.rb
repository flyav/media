class Medium < ActiveRecord::Base
  
  #serialize :genre, Array
  #serialize :cast, Array    

  #before_validation :update_genre
  #before_validation :update_cast
  
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  #validates :own, presence: true
  #validates :watched, presence: true

  scope :watched, -> watched { where(watched: watched) }
  scope :own, -> own { where(own: own) }

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |medium|
        csv << medium.attributes.values_at(*column_names)
      end
    end
  end 

  def self.text_search(query)
    if query.present?
      search(query)
    else
      find(:all)
    end
  end


  #def update_genre
   # if genre_changed?
   # self.genre = self.genre.split(',').collect(&:strip)
   # end
  #end
  
  #def update_cast
   # if cast_changed?
    #self.cast = self.cast.split(',').collect(&:strip)
   # end
  #end
end
