class PeselValidate

  def initialize(str1)
    @str1 = str1
  end

  public 

  def validate

    return false if (@str1 =~ /\A\d+\Z/) == nil
    return false if @str1.length != 11 

    return true if check_digit(@str1)
    return false

  end

  private

  def check_digit(val)

    digit = [1,3,7,9,1,3,7,9,1,3]                         
    sum = 0                                               
    i = 0                                                 
    arr = val[0...-1]                                     

    arr.chars.to_a.each do |x| 
      sum += x.to_i * digit[i]
      i += 1
    end

    x = sum % 10

    if (x == 0) && (val[val.length].to_i == 0)
      return true
    elsif val[val.length - 1].to_i == (10 - x)
      return true
    else
      return false
    end

  end
  
end