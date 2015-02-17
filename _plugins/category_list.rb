# place this file in your plugins directory and add the tag to your sidebar
#$ cat source/_includes/custom/asides/categories.html
#<section>
# <h1>Categories</h1>
# <ul id="categories">
# {% category_list %}
# </ul>
#</section>
 
module Jekyll
	class CategoryListTag < Liquid::Tag
		def render(context)
			html = ""
			categories = context.registers[:site].tags.keys
			categories.sort.each do |category|
				posts_in_category = context.registers[:site].tags[category].size
				html << "<li class='category'><a href='/tag/#{category}/'>#{category} (#{posts_in_category})</a></li>\n"
			end
			html
		end
	end
end
 
Liquid::Template.register_tag('category_list', Jekyll::CategoryListTag) 
