A project to scrape github and find out a few things:

 * projects with 
   * most frequent commits
   * largest repository
   * most committers

 * members who
   * commit on the most repositories
   * are the most active

Also it would be nice to track things like library usage overtime.  For instance, when did angular or coffeescript become popular amongst the repositories or what version is most widely used.

Perhaps looking for something like the most commonly included file or the largest common ngram

Speeding things up a bit:

If you put this in a raid you may find it surprising that you get dozens of gigabytes of memory used up and the computer seems to crawl after a while.

I've found, on ext4 systems that disabling the journal and enabling writeback can improve life:

    # tune2fs -o journal_data_writeback /dev/md0
    # tune2fs -O ^has_journal /dev/md0

 You may have to put in some e2fsck in there.  mdadm also likes to "cache"
 memory but the allocator is kinda stupid and you can still hit swap - which
 means that turning the swapoff may help you here.
