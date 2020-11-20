#!/bin/bash
mkdir test && { 
            echo "catalog test was created successfully" > test/report;
            touch test/$(date | tr "[:space:]" "_")
            }
ping www.net_nikogo.ru || echo "[$(date)]: unreachable host" >> test/report
