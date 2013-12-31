
/* LGE_CHANGE_S
 *
 * do read/mmap profiling during booting
 * in order to use the data as readahead args
 *
 * byungchul.park@lge.com 20120503
 */
extern int sreadahead_prof(
	struct file *filp,
	size_t len,
	loff_t pos);
/* LGE_CHANGE_E */
