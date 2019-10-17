#!/usr/bin/fish

for fn in *fq.gz
	md5sum $fn
	ls -l --time-style=full-iso $fn
	zcat $fn | head -1
	pigz -dc  $fn | wc -l
end >> all_A_M_after_rename_md5.4lines
