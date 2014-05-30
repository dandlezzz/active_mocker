module ActiveMocker

module Collection

  class Association < Base

    include Queries

    def initialize(collection, association_class=nil)
      @association_class = association_class
      super(collection)
    end

    def create(args={})
      add_and_return(@association_class.create(args))
    end

    alias_method :create!, :create

    def build(args={})
      add_and_return(@association_class.new(args))
    end

    private

    def add_and_return(record)
      self.<< record
      record
    end

  end

  # collection(force_reload = false)
  # collection<<(object, ...)
  # collection.delete(object, ...)
  # collection.destroy(object, ...)
  # collection=objects
  # collection_singular_ids
  # collection_singular_ids=ids
  # collection.clear
  # collection.empty?
  # collection.size
  # collection.find(...)
  # collection.where(...)
  # collection.exists?(...)
  # collection.build(attributes = {}, ...)
  # collection.create(attributes = {})
  # collection.create!(attributes = {})

end
end