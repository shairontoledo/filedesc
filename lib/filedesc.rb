module FileDescription

  OPTIONS = {:executable => '/usr/bin/file' }

  def mime
    @mime ||= get_output('-I')
    @mime
  end

  def is_a_mime?(type)
    return case type
    when String
      mime == type
    when Regexp
      !(mime !~ type)
    end
  end

  def description
    @description ||= get_output
    @description
  end

  def has_description?(regexp)
    !(description !~ regexp)
  end
  
  def extension
    self.path.scan(/\.([A-za-z0-9]+)$/).flatten.last.to_s
  end

  def inspect
    "#<File:#{self.path}, mime: '#{mime}', description: '#{description}', extension: '#{extension}' >"
  end

  def info
      {
        :filename =>   File.basename(self.path),
        :mime =>   mime,
        :description =>   description,
        :extension =>   extension,
        :directory =>  File.dirname(self.path),
        :path =>  self.path,
        :size => File.size(self.path),
        :last_modified => File.mtime(self.path),
        :last_access => File.atime(self.path),
        :executable => File.executable?(self.path),
        :gid => File.stat(self.path).gid,
        :uid => File.stat(self.path).uid,
        :mode => File.stat(self.path).mode

      }
  end
  
  private
  def get_output(params="")
    `#{OPTIONS[:executable]} -b #{params} '#{self.path}'`.strip
  end
end
  
class File
  include FileDescription
end
