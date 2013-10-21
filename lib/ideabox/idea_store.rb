class IdeaStore
  def self.save(idea)
    @all ||= []
    id = next_id
    @all[id] = idea
    id
  end

  def self.find(id)
    @all[id]
  end

  def self.next_id
    @all.size
  end

  def self.count
    @all.length
  end

  def self.delete_all
    @all = []
  end
end

# class IdeaStore
#   def self.save(idea)
#     @all ||= []
#     @all << idea
#   end

#   def self.find(id)
#     @all.first
#   end

#   def self.count
#     @all.length
#   end
# end
