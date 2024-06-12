def stock_picker(stockPriceArray)
  bestDates = {}
  bestValues = Array.new(stockPriceArray.length, 0)
  stockPriceArray.each_with_index do |buyPrice, buyIndex|
    stockPriceArray[buyIndex..-1].each_with_index do |sellPrice, sellIndex|
      if bestValues[buyIndex] < (sellPrice - buyPrice)
        bestValues[buyIndex] = (sellPrice - buyPrice)
        bestDates[buyIndex] = sellIndex + buyIndex
      end
    end
  end
  hashIndex = bestValues.find_index(bestValues.max)
  [hashIndex, bestDates[hashIndex]].to_s
end