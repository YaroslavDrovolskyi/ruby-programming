print "Enter x: "
x = gets.to_f

print "Enter a: "
a = gets.to_f

print "Enter b: "
b = gets.to_f

print "Enter c: "
c = gets.to_f

print "Enter phi:"
phi = gets.to_f

s = ((Math.sin(3*x))**3 + Math.atan(phi) - 6 * 10**3.1)/(Math.sqrt(a*(x**2) + b*x + c)) + Math.exp(x) * (Math.tan(x+2)).abs

print "s = ", s