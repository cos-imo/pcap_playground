#include <stdio.h>
#include <stdlib.h>
#include <pcap.h>

int main(int argc, char **argv) {
    char errbuf[PCAP_ERRBUF_SIZE] = {0}; 
    pcap_if_t *alldevsp = NULL;

    if(pcap_findalldevs(&alldevsp, errbuf)==0) {
	    printf("Listing all devices\n");
	    while(alldevsp){
		printf("\n\t%s\n\t\t%s\n", alldevsp->name, alldevsp->description);
		alldevsp = alldevsp->next;
	    }

	    pcap_freealldevs(alldevsp);
    } else {

	printf("Error while scanning interfaces: %s \n", errbuf);
	exit(-1);
}

    return 0;
}
