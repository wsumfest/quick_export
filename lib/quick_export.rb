require "quick_export/version"
require "active_record"
require "csv"

@@csv_extension = ".csv"
@@xls_extension = ".xls"

class ActiveRecord::Base 
	"""
  	Generates a string of random letters for filenames.
  	""" 
    def self.generate_random_filename
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		(0...30).map { o[rand(o.length)] }.join
	end

	"""
	Getter method for csv file extension.
	"""
	def self.get_csv_extension
		@@csv_extension
	end

	"""
	Getter method for xls file extension.
	"""
	def self.get_xls_extension
		@@xls_extension
	end

	"""
	Generates a full filename with extension.
	"""
	def self.build_filename(is_csv=true)
		filename = ""
		if is_csv
			filename = generate_random_filename + get_csv_extension

		else
			filename = generate_random_filename + get_xls_extension
		end
		filename
	end
	
end

class ActiveRecord::Relation 

	"""
	Export new file to inside root path.
	"""
	def export(root_path, is_csv=true)
		filename = ActiveRecord::Base.build_filename(is_csv)
		full_path = File.join(root_path, filename)
		self.write_to_file(full_path, is_csv)

	end

	"""
	Getter method for active record relations.
	"""
	def generate_sql
		self.to_sql
	end

	"""
	Execute MySQL query given.
	"""
	def execute_query
		sql = self.generate_sql
		ActiveRecord::Base.connection.reconnect!
		ActiveRecord::Base.connection.execute(sql)
	end

	def write_to_file(filename, is_csv)
		data = self.execute_query
		CSV.open(filename, "w") do |csv|
			csv << self.format_data(data.fields, is_csv)
			data.each do |row|
				csv << self.format_data(row, is_csv)
			end
		end
		filename
	end

	"""
	Formats an array of values, seperating it either by tabs or commas and enclosing it with quotations.
	"""
	def format_data(arr, is_csv)
		ret = ""
		arr = arr.map { |a| "'#{a}'" }
		if is_csv
			ret = arr.join(",")
		else
			ret = arr.join("\t")
		end
		ret
	end

end
