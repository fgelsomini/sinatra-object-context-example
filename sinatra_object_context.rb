class Template

  def render
    self.instance_variables.each do |variable|
      puts "I know about #{variable} who's value is: #{instance_variable_get(variable)}"
    end
  end

end

class Route < Template

  def get(path)
    @get_response = "I'm getting #{path}!"
  end

  def post(path)
    @post_response = "I'm getting #{path}!"
  end

end

class Request < Route

  def initialize(verb, path)
    self.send(verb.downcase, path)
    render
  end

end


request = Request.new("GET","/contacts")
