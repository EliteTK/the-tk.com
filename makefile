VPATH = parts:src

output = ./output
errors = $(output)/error

PAGES = index.html about.html projects.html
ERRORS = 404 500 502 503 504
ERRORS := $(addsuffix .html,$(ERRORS))
EXISTING = images/glider-yellow.png images/EFF.png images/GNU.png \
	   style.css images/TK.png images/TK-32.png images/TK-64.png \
	   images/TK-128.png images/TK-256.png
OUTPUTS = $(PAGES) $(ERRORS)
STRUCTURE = $(addprefix $(errors)/,$(ERRORS)) $(addprefix $(output)/,$(PAGES))

TARBALL = web.tar.gz

.PHONY: all
all: $(STRUCTURE)

$(STRUCTURE): $(OUTPUTS)
	cp $(ERRORS) $(errors)
	cp $(PAGES) $(output)

%.html: %.pre
	sed -e "s&<!--TITLE-->&$$(sed -n -e 's@<!--TITLE\"\(.*\)\"-->@\1@p' $^)&" $^ >$@

%.pre: header.part %.mid.part footer.part
	cat $^ >$@

%.mid.part: %.mkdn
	cmark $^ >$@

.PHONY: tarball
tarball: $(TARBALL)

$(TARBALL): $(STRUCTURE) $(addprefix $(output)/,$(EXISTING))
	tar -cvaf $@ $^

.PHONY: clean
clean:
	$(RM) *.html *.mid.part $(STRUCTURE) $(tarball)
