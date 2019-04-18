class ComplexNumber
    attr_accessor :real , :imag
    # @@sum_count=0
    # @@mul_count=0
    # attr_reader :sum_count , :mul_count
    @@state = { "sum_count" => 0, "mul_count" => 0 }
    attr_reader :state

    def initialize(r=1,i=1)
        @real=r
        @imag=i
    end

    def +(cn1)
        # @@sum_count+=1
        @@state["sum_count"]+=1
        cn2=ComplexNumber.new
        cn2.real=@real+cn1.real
        cn2.imag=@imag+cn1.imag
        # print_complex(cn2)
        return cn2
    end

    def *(cn1)
        # @@mul_count+=1
        @@state["mul_count"]+=1
        cn2=ComplexNumber.new
        cn2.real=@real*cn1.real
        cn2.imag=@imag*cn1.imag
        # print_complex(cn2)
        return cn2
    end


    def self.bulk_add​ (cns)
        sum=ComplexNumber.new
        sum.real=0
        sum.imag=0
        cns.each{|cn| sum+=cn}
        print_complex(sum)
    end

    def self.bulk_multiply(cns)
        mul=ComplexNumber.new
        mul.real=1
        mul.imag=1
        cns.each{|cn| mul*=cn}
        print_complex(mul)
    end


    def self.print_complex(c)
        puts " #{c.real} + #{c.imag} i"
    end

    def self.print_count()
        # puts " The sum count is : #{@@sum_count}  , and mul count is :  #{@@mul_count} "
        puts " The sum count is : #{@@state["sum_count"]}  , and mul count is :  #{@@state["mul_count"]} "
    end

end


cn=ComplexNumber.new
cn2=ComplexNumber.new(2,3)
ComplexNumber.print_complex(cn+cn2)


cn3=ComplexNumber.new(4,1)

arr=[]
arr.push(cn)
arr.push(cn2)
arr.push(cn3)

ComplexNumber.bulk_add​(arr)
ComplexNumber.bulk_multiply(arr)

ComplexNumber.print_count()











