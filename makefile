
VPATH = parts:src

output = ./output
errors = $(output)/error

PAGES = index.html about.html projects.html
ERRORS = 404 500 502 503 504
ERRORS := $(addsuffix .html,$(ERRORS))
EXISTING = glider-yellow.png EFF.png GNU.png favicon.png style.css
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
	markdown $^ >$@

.PHONY: tarball
tarball: $(TARBALL)

$(TARBALL): $(STRUCTURE) $(addprefix $(output)/,$(EXISTING))
	tar -cvaf $@ $^

.PHONY: clean
clean:
	$(RM) *.html *.mid.part $(STRUCTURE) $(tarball)
