[Apertium](http://wiki.apertium.org) is a machine translation platform, we use it a.o. for sme-sma.

# Converting the fst

In order to convert the South Sami fst to Apertium, do the following, in `langs/sma`:

```
./configure --with-hfst --enable-apertium
make
cd src
make analyser-apertium-norm.att
gzip -9 analyser-apertium-norm.att
cp analyser-apertium-norm.att.gz /path/to/your/apertium/nursery/apertium-sme-sma/apertium-sme-sma.sma.att.gz 
```

* Then compile in the apertium folder, and check that everything is well. 
* Then chechk in the `apertium-sme-sma.sma.att.gz` file.

# Documenting the conversion setup

tbw.
