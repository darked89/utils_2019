#!/usr/bin/fish

for fn in idsc*norm.vcf.avinput
    ../annovar_20190611/run29_annot.sh.dev $fn (basename $fn .vcf.avinput).annovar
end

