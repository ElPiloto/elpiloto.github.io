#BASE_DIR = 'source/images/galleries'
BASE_DIR = 'source/images/research/sleep_eeg_9_subjects_06_23_2014/'

module ImageList
  def image_list( name )
    list = Array.new
    dir = Dir.new( File.join(BASE_DIR, name) )
    dir.each do | d |
      image = File.basename(d, File.extname(d))
      unless d =~ /^\./ || d =~ /thumbs/
        list << %Q{<a href="/images/research/sleep_eeg_9_subjects_06_23_2014/#{name}/#{d}" rel="shadowbox" title="#{image}"><img src="/images/research/sleep_eeg_9_subjects_06_23_2014/#{name}/thumbs/#{d}" /></a>}
      end
    end
    list.sort.join( "\n" )
  end
end

Liquid::Template.register_filter(ImageList)
