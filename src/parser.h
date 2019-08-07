#ifndef PARSER_H
#define PARSER_H
#include "darknet.h"
#include "network.h"

void save_network(network net, char *filename);
void save_weights_double(network net, char *filename);
void save_convolutional_weights_split(layer* l, const char* sDir);

#endif
