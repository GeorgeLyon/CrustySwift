#include "example.capnp.h"
/* AUTO GENERATED - DO NOT EDIT */
#ifdef __GNUC__
# define capnp_unused __attribute__((unused))
# define capnp_use(x) (void) (x);
#else
# define capnp_unused
# define capnp_use(x)
#endif


Request_ptr new_Request(struct capn_segment *s) {
	Request_ptr p;
	p.p = capn_new_struct(s, 16, 0);
	return p;
}
Request_list new_Request_list(struct capn_segment *s, int len) {
	Request_list p;
	p.p = capn_new_list(s, len, 16, 0);
	return p;
}
void read_Request(struct Request *s capnp_unused, Request_ptr p) {
	capn_resolve(&p.p);
	capnp_use(s);
	s->lhs = capn_read64(p.p, 0);
	s->rhs = capn_read64(p.p, 8);
}
void write_Request(const struct Request *s capnp_unused, Request_ptr p) {
	capn_resolve(&p.p);
	capnp_use(s);
	capn_write64(p.p, 0, s->lhs);
	capn_write64(p.p, 8, s->rhs);
}
void get_Request(struct Request *s, Request_list l, int i) {
	Request_ptr p;
	p.p = capn_getp(l.p, i, 0);
	read_Request(s, p);
}
void set_Request(const struct Request *s, Request_list l, int i) {
	Request_ptr p;
	p.p = capn_getp(l.p, i, 0);
	write_Request(s, p);
}

Response_ptr new_Response(struct capn_segment *s) {
	Response_ptr p;
	p.p = capn_new_struct(s, 16, 0);
	return p;
}
Response_list new_Response_list(struct capn_segment *s, int len) {
	Response_list p;
	p.p = capn_new_list(s, len, 16, 0);
	return p;
}
void read_Response(struct Response *s capnp_unused, Response_ptr p) {
	capn_resolve(&p.p);
	capnp_use(s);
	s->boringSum = capn_read64(p.p, 0);
	s->capnpSum = capn_read64(p.p, 8);
}
void write_Response(const struct Response *s capnp_unused, Response_ptr p) {
	capn_resolve(&p.p);
	capnp_use(s);
	capn_write64(p.p, 0, s->boringSum);
	capn_write64(p.p, 8, s->capnpSum);
}
void get_Response(struct Response *s, Response_list l, int i) {
	Response_ptr p;
	p.p = capn_getp(l.p, i, 0);
	read_Response(s, p);
}
void set_Response(const struct Response *s, Response_list l, int i) {
	Response_ptr p;
	p.p = capn_getp(l.p, i, 0);
	write_Response(s, p);
}
