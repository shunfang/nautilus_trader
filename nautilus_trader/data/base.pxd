# -------------------------------------------------------------------------------------------------
#  Copyright (C) 2015-2020 Nautech Systems Pty Ltd. All rights reserved.
#  https://nautechsystems.io
#
#  Licensed under the GNU Lesser General Public License Version 3.0 (the "License");
#  You may not use this file except in compliance with the License.
#  You may obtain a copy of the License at https://www.gnu.org/licenses/lgpl-3.0.en.html
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# -------------------------------------------------------------------------------------------------

from nautilus_trader.common.constants cimport *  # str constants
from nautilus_trader.model.bar cimport Bar
from nautilus_trader.model.bar cimport BarType
from nautilus_trader.model.c_enums.price_type cimport PriceType
from nautilus_trader.model.currency cimport Currency
from nautilus_trader.model.identifiers cimport Symbol
from nautilus_trader.model.instrument cimport Instrument
from nautilus_trader.model.tick cimport QuoteTick
from nautilus_trader.model.tick cimport TradeTick


cdef class DataCacheFacade:
    cdef int _tick_capacity
    cdef int _bar_capacity

# -- QUERIES ---------------------------------------------------------------------------------------

    cpdef list symbols(self)
    cpdef list instruments(self)
    cpdef list quote_ticks(self, Symbol symbol)
    cpdef list trade_ticks(self, Symbol symbol)
    cpdef list bars(self, BarType bar_type)
    cpdef Instrument instrument(self, Symbol symbol)
    cpdef QuoteTick quote_tick(self, Symbol symbol, int index=*)
    cpdef TradeTick trade_tick(self, Symbol symbol, int index=*)
    cpdef Bar bar(self, BarType bar_type, int index=*)
    cpdef int quote_tick_count(self, Symbol symbol) except *
    cpdef int trade_tick_count(self, Symbol symbol) except *
    cpdef int bar_count(self, BarType bar_type) except *
    cpdef bint has_quote_ticks(self, Symbol symbol) except *
    cpdef bint has_trade_ticks(self, Symbol symbol) except *
    cpdef bint has_bars(self, BarType bar_type) except *

    cpdef double get_xrate(
        self,
        Currency from_currency,
        Currency to_currency,
        PriceType price_type=*,
    ) except *