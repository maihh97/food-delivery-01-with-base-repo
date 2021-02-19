require "csv"

class BaseRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist? @csv_file
  end

  def all
    @elements.sort_by{|element| element.id}
  end

  def find(id)
    @elements.select{|element| element.id == id}.first
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def update(id, new_element)
    old_element = find(id)
    @elements.delete(old_element)
    new_element.id = id
    @elements << new_element
    save_csv
  end

  def destroy(id)
    old_element = find(id)
    @elements.delete(old_element)
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  private

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
      @next_id += 1
    end
  end
end
