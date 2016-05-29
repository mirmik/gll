mk = {}

function mk.rule_build(container, prototype)
	local lp
	local s
	local str = prototype
	for p in string.gmatch(prototype,"{%w+}") do
		lp = string.sub(p, 2, #p -1)
		s = container[lp] 
		str = string.gsub(str,p,s)
	end
	return str
end

function mk.use_rule(rule,src,tgt)
	local instr = rule
	instr = string.tblgsub(instr,{"#src","#tgt"},{src,tgt})
	print(instr)
	if not os.execute(instr) then
		print(colorizing.red("Error at rule using operation"))
		os.exit()
	end
end

function mk.use_rule_on_list(rule,src,tgt)
	assert(#src == #tgt)
	for i = 1, #src do
		mk.use_rule(rule,src[i],tgt[i])
	end
end


function mk.build_module(mod,ruls,vars) 

end