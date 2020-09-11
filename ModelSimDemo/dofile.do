add wave -position insertpoint  \
sim:/exor/A \
sim:/exor/B \
sim:/exor/Y
force -freeze sim:/exor/A 0 0
force -freeze sim:/exor/B 0 0
run 100ps
force -freeze sim:/exor/A 0 0
force -freeze sim:/exor/B 1 0
run 100ps
force -freeze sim:/exor/A 1 0
force -freeze sim:/exor/B 0 0
run 100ps
force -freeze sim:/exor/A 1 0
force -freeze sim:/exor/B 1 0
run 100ps
