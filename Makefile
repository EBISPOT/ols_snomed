ROBOT = robot
URIBASE = http://purl.obolibrary.org/obo
ONTS = snomed
ONTFILES = $(foreach n, $(ONTS), ontologies/$(n).owl)
VERSION = "0.0.1" 
IM=ebispot/ols-snomed

docker-build:
	@docker build -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM):latest
	
docker-build-no-cache:
	@docker build --no-cache -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM):latest
	
docker-run:
	@docker run -p 8080:8080 -t $(IM):$(VERSION)


